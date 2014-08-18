#!/usr/bin/python

from dulwich.repo import Repo

repo = Repo(".")
index = repo.open_index()
print list(index)
print repo.head();
