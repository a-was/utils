# Personal GitHub account
Host github.com-personal
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa_personal

# Work GitHub account
Host github.com-work
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa_work



[remote "origin"]
  url = git@github.com-personal:YourUsername/YourRepo.git

```bash
git clone git@github.com-personal:YourUsername/YourRepo.git
git clone git@github.com-work:WorkOrg/WorkRepo.git
```
