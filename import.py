#%%
import pandas as pd
import yfinance as yf

#%%

file_name = "data/amazon.csv"

if not os.path.exists(file_name):
    print(f"Arquivo não encontrado: {file_name}")
    df = None
else:
    print(f"Arquivo encontrado: {file_name}")
    df = pd.read_csv(file_name)

if df is not None:
    print(df.head())

#%%
## normalizando valor de rubris em reais

ticker = yf.Ticker("INRBRL=X")

cotacao_inr_brl = ticker.history(period="1d")["Close"].iloc[-1]
print(f"Cotação da Rupia hoje (via Yahoo Finance): R$ {cotacao_inr_brl:.4f}")

colunas_preco = ["actual_price", "discounted_price"]

for col in colunas_preco:
    df[col] = df[col].astype(str).str.replace("₹", "", regex=False).str.replace(",", "", regex=False)
    df[col] = pd.to_numeric(df[col], errors='coerce')

df[colunas_preco] = df[colunas_preco] * cotacao_inr_brl

print("\nPreços convertidos para Real (R$):")
print(df[colunas_preco].head())

#%%
#normalizando a coluna porcentagem, deixando como valor númerico

df["discount_percentage"] = (
    df["discount_percentage"]
    .astype(str)
    .str.replace("%", "", regex=False)
)
df["discount_percentage"] = pd.to_numeric(df["discount_percentage"], errors="coerce") / 100

df

#%%

# enviando informações para um banco de dados
from sqlalchemy import create_engine
from dotenv import load_dotenv
import os

load_dotenv()

usuario = os.getenv("USUARIO")
senha = os.getenv("SENHA")
host = os.getenv("HOST")
porta = os.getenv("PORTA")
banco = os.getenv("BANCO")

if not all([usuario, senha, host, porta, banco]):
    raise EnvironmentError("Uma ou mais variáveis de ambiente não foram carregadas. Verifique o arquivo .env")

url_conexao = f'postgresql://{usuario}:{senha}@{host}:{porta}/{banco}'
engine = create_engine(url_conexao)

df.to_sql("nome_da_tabela", engine, if_exists="replace", index=False)