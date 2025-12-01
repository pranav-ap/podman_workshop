import os 


def main():
    print("Hello from Podman + Alpine!")
    print(f'APP_ENV={os.environ.get('APP_ENV')}')


if __name__ == '__main__':
    main()
    