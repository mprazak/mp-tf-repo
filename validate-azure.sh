#!/bin/bash

echo "🔐 Přihlašování do Azure pomocí Service Principal..."
az login --service-principal \
  --username "$ARM_CLIENT_ID" \
  --password "$ARM_CLIENT_SECRET" \
  --tenant "$ARM_TENANT_ID" >/dev/null

if [ $? -ne 0 ]; then
  echo "❌ Přihlášení selhalo. Zkontroluj přihlašovací údaje."
  exit 1
fi

echo "✅ Přihlášení úspěšné."

echo "🔎 Nastavuji subscription: $ARM_SUBSCRIPTION_ID"
az account set --subscription "$ARM_SUBSCRIPTION_ID"

CURRENT_SUBSCRIPTION=$(az account show --query id -o tsv)

if [ "$CURRENT_SUBSCRIPTION" != "$ARM_SUBSCRIPTION_ID" ]; then
  echo "❌ Subscription ID neodpovídá. Očekáváno: $ARM_SUBSCRIPTION_ID, aktuální: $CURRENT_SUBSCRIPTION"
  exit 1
fi

echo "✅ Subscription ID je správné."

echo "🔍 Kontroluji přístup k resource group: $RESOURCE_GROUP"
az group show --name "$RESOURCE_GROUP" >/dev/null

if [ $? -ne 0 ]; then
  echo "❌ Resource Group '$RESOURCE_GROUP' není dostupná nebo neexistuje v této subscription."
  exit 1
fi

echo "✅ Přístup k Resource Group potvrzen."

echo "🎉 Validace připojení k Azure byla úspěšná!"
