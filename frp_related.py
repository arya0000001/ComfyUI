
import time
import logging

import requests

def add_backend_host_to_worker_kv(backend_host):
    worker_url = "https://log.yesky.online/add-backend"

    # 构造要发送的 JSON 数据
    # 这里的 "url" 键必须与 Worker 期望的参数名相匹配
    payload = {
        "url": backend_host
    }

    try:
        # 发送 POST 请求
        response = requests.post(worker_url, json=payload)

        # 检查响应状态码。
        # 200 表示成功，201 表示创建成功等。
        if response.status_code == 200:
            print("请求成功！")
            print("响应内容:", response.text)
        else:
            print(f"请求失败，状态码: {response.status_code}")
            print("错误信息:", response.text)

    except requests.exceptions.RequestException as e:
        # 处理网络请求中可能发生的异常，例如连接错误
        print(f"请求发生异常: {e}")



import subprocess
import random

import uuid

# 生成基于UUID的随机字符串, 以comfy-开头。 在 Cloudflare DNS记录中配置。
def generate_subname(kaggle_name):
    uuid_part = str(uuid.uuid4()).replace('-', '')
    return f"{kaggle_name}-{uuid_part}"


def start_frp():

    # subprocess.Popen(["sed", "-i", f"s/REMOTE_PORT/{port}/g", "/kaggle/working/frpc.toml"],shell=False)
    subname = generate_subname("comfy")
    subprocess.Popen(["sed", "-i", f"s/REMOTE/{subname}/g", "/kaggle/working/frpc.toml"],shell=False)

    subprocess.run(['chmod', '+x', '/kaggle/working/frpc'], check=True)
    time.sleep(3)
    with open('/kaggle/working/frpc.log', 'a') as log_file:
        subprocess.Popen(['/kaggle/working/frpc', '-c', '/kaggle/working/frpc.toml'], stdout=log_file, stderr=subprocess.STDOUT, start_new_session=True)
    logging.info(f'frp已经启动')


    add_backend_host_to_worker_kv(f"{subname}.yesky.online")

    # notion.add_record_to_notion_database(f"https://k.yesky.online")
    # add_backend_host_to_worker_kv(f"k.yesky.online")
