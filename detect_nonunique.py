import pandas as pd
from rdkit import Chem
import sys

def is_same_smiles(smi1,smi2):
    m1 = Chem.MolFromSmiles(smi1)
    m2 = Chem.MolFromSmiles(smi2)
    return (m1.HasSubstructMatch(m2) and m2.HasSubstructMatch(m1))

def canonicalize(smi):
    return Chem.MolToSmiles(Chem.MolFromSmiles(smi))


df = pd.read_csv(sys.argv[1])

SMI_list = list(df.SMILES.apply(canonicalize))
new_list = []
for index in range(len(SMI_list)):
    if SMI_list[index] in new_list:
        print(index,'is duplicate of',new_list.index(SMI_list[index]))
        break
    else:
        new_list.append(SMI_list[index])
