# Downgrade mysql from 8.0 to 5.7 MACOS-mojave
### 1. Uninstall all version mysql:
```sh
brew uninstall mysql # remove default installed mysql may be 8.0
brew uninstall mysql@5.7 # remove old mysql@5.7
rm -rf /usr/local/var/mysql
rm /usr/local/etc/my.cnf

brew unlink mysql
```
### 2. Install MySQL 5.7
```sh
brew install mysql@5.7
```
### 3. Link to homebrew to new `mysql`
```sh
brew link --force mysql@5.7
```
### 4. Start mysql with `home brew`
```sh
brew services start mysql@5.7
```
# Important: 
restart you mac;

# Some issues:
## cannot access user root:
#### ErrorCode: `Access denied for user 'root'@'localhost' `
### Solution: change password root
#### Step 1: login to root
```sh
sudo -i
```
#### Step 2: 
```sh
sudo mysqld_safe --skip-grant-tables &
```
### Step 3: Login to user root mysql
```sh
mysql -u root
```

### Step 4: Change password root user:
```sh
use mysql;
update user set authentication_string=password('123') where user='root';
flush privileges;
\q # quit mysql commandline
```
### Step 5: restart mysql;
#### Option 1(recommend)
```sh
brew services stop mysql@5.7
brew services start mysql@5.7
```
#### Option 2
```sh
brew services restart mysql@5.7
```
### Step 6: Try to re-access mysql:
```sh
mysql -u root -p
```
