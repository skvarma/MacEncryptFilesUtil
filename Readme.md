# File Encrypt Utility for Mac

This utility can be used to encrypt a file on  a mac. It uses a combination of keychain & OpenSSL to do the encryption  
* KeyChain is used to store a key for encryption  
* OpenSSL is used to actually encrypt & decrypt a file  


## Usage Instructions
1. [Create a new Keychain entry in your mac](https://help.apple.com/keychainaccess/mac/10.11/index.html?localePath=en.lproj#/kyca1120)  
2. Copy the enc.sh to your home directory  
3. Run it  
./enc.sh {1} {2} {3} {4}
where  
{1} = -en / -dy		*(en to encrypt/ dy to decrypt)*  
{2} = folder where the dile to be encrypted/decrypted is stored  
{3} = name of file to encrypt  
{4} = **Account Name** you used when creating the key in Keychain  
**Make sure it is the account name from the keychain & not the Keychain Item Name**   
*SAMPLE Encryption Command - ./enc.sh -en ~/Documents file.xlsx keychain_account_name*  
*SAMPLE Decryption Command - ./enc.sh -dy ~/Documents file.xlsx keychain_account_name*  
4. (optional)  Create aliases to encrypt and decrypt  
		#alias en="./enc.sh -en ~/Documents file.xlsx encrypt_file"  
		#alias dy="./enc.sh -dy ~/Documents file.xlsx encrypt_file"
5. First time you run the script, you will be prompted to grant access to the key. You can either click Allow or Always Allow

# Make sure you test the script first with a sample file before encrypting anything else.  
