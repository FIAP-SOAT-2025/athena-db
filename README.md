# Terraform - DB

Este projeto do Terraform é responsável por provisionar um banco de dados PostgreSQL na AWS usando o serviço RDS (Relational Database Service).

## Pré-requisitos

Para utilizar este projeto, você precisará ter as seguintes ferramentas instaladas:

*   [Terraform](https://www.terraform.io/downloads.html) (versão 1.6.0 ou superior)
*   [AWS CLI](https://aws.amazon.com/cli/)

Além disso, você precisará de credenciais da AWS configuradas em seu ambiente.

## Como usar

1.  **Clone o repositório:**

    ```bash
    git clone <https://github.com/FIAP-SOAT-2025/terraform-db>
    ```

2.  **Inicialize o Terraform:**

    ```bash
    terraform init
    ```

3.  **Crie um arquivo `terraform.tfvars`** para fornecer os valores para as variáveis de entrada. Você pode usar o arquivo `terraform.tfvars.example` como modelo:

    ```hcl
    db_user     = "seu-usuario"
    db_password = "sua-senha-segura"
    db_name     = "seu-banco-de-dados"
    access_token = "seu-token-de-acesso"
    ```

4.  **Planeje as alterações:**

    ```bash
    terraform plan
    ```

5.  **Aplique as alterações:**

    ```bash
    terraform apply
    ```

## Recursos

Este projeto cria os seguintes recursos na AWS:

*   **`aws_db_instance`**: Uma instância de banco de dados RDS com o PostgreSQL 15.
*   **`aws_db_subnet_group`**: Um grupo de sub-redes para a instância RDS, garantindo que ela seja provisionada em sub-redes privadas.
*   **`aws_security_group`**: Um grupo de segurança que permite o tráfego da aplicação para a porta do PostgreSQL (5432).

## Inputs

| Nome | Descrição | Tipo | Padrão | Sensível |
| --- | --- | --- | --- | --- |
| `projectName` | O nome do projeto. | `string` | `"tc5-g192-athena"` | não |
| `db_user` | O nome de usuário para o banco de dados RDS. | `string` | - | sim |
| `db_password` | A senha para o usuário do banco de dados RDS. | `string` | - | sim |
| `access_token` | O Access Token para integração com APIs externas. | `string` | - | sim |
| `db_name` | O nome do banco de dados inicial a ser criado na instância RDS. | `string` | - | não |

## Outputs

| Nome | Descrição |
| --- | --- |
| `db_instance_address` | O endereço (endpoint) da instância RDS. |
| `db_instance_port` | A porta de conexão da instância RDS. |

## Pipeline de CI/CD

Este projeto utiliza o GitHub Actions para automação de CI/CD. O workflow está definido em `.github/workflows/terraform.yml` e inclui os seguintes jobs:

*   **`check-infrastructure`**: Verifica se a infraestrutura base (cluster EKS) existe.
*   **`terraform-check`**: Executa `terraform init`, `fmt`, `validate` e `plan` para garantir a qualidade e a sintaxe do código.
*   **`terraform-apply`**: Aplica as alterações do Terraform no ambiente de produção quando há um push para a branch `main`.
*   **`terraform-destroy`**: Destroi a infraestrutura quando o workflow é acionado manualmente com a ação `destroy`.
