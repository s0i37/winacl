@echo off
set hiddenimports= --hidden-import cryptography --hidden-import cffi --hidden-import cryptography.hazmat.backends.openssl --hidden-import cryptography.hazmat.bindings._openssl --hidden-import unicrypto --hidden-import unicrypto.backends.pycryptodome.DES --hidden-import  unicrypto.backends.pycryptodome.TDES --hidden-import unicrypto.backends.pycryptodome.AES --hidden-import unicrypto.backends.pycryptodome.RC4 --hidden-import unicrypto.backends.pure.DES --hidden-import  unicrypto.backends.pure.TDES --hidden-import unicrypto.backends.pure.AES --hidden-import unicrypto.backends.pure.RC4 --hidden-import unicrypto.backends.cryptography.DES --hidden-import  unicrypto.backends.cryptography.TDES --hidden-import unicrypto.backends.cryptography.AES --hidden-import unicrypto.backends.cryptography.RC4 --hidden-import unicrypto.backends.pycryptodomex.DES --hidden-import  unicrypto.backends.pycryptodomex.TDES --hidden-import unicrypto.backends.pycryptodomex.AES --hidden-import unicrypto.backends.pycryptodomex.RC4
set root=%~dp0
set projectname=winacl
set repo=%root%..\..\%projectname%
IF NOT DEFINED __BUILDALL_VENV__ (
set pyenv=%root%\env
python -m venv %pyenv%
%pyenv%\Scripts\activate.bat &^
pip install pyinstaller ) &^
cd %repo%\..\ &^
pip install . &^
cd %repo%\examples &^
pyinstaller -F userinfo.py %hiddenimports% &^
pyinstaller -F serviceacl.py %hiddenimports% &^
cd %repo%\examples\dist & copy *.exe %root% &^
IF NOT DEFINED __BUILDALL_VENV__ (
deactivate
) &^
cd %root%