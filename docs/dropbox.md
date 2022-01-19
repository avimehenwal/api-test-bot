## Test Plan for Dropbox Application

Dropbox

## APP information

- Not a webapp, desktop app
- user can log in / but skip ATM

### Functional

- Is application available?

CompA CompB

1. CompA: FileA is copied to Dropbox

.txt
.doc
.mov
.mp3

5 GB,

- 2.5 GB
- 4.8
- 5 GB

Folders: A -> B

1. size - #hash the file
2. directory hierarchy
3. if the event was loggesd?

testUser

SetUp

- CompA, CompB should be rady with userA and userB
- Dropbox Application

1. (UserA on CompA) copies FILEA to Dropbox Folder, #shared with everyone
   1. Wait until Dropbox Logs a file-Registered event
2. (UserB on CompB) opens Dropbox Folder
3. Assertions : UserB should see FileA in DropBox Folder
4. Assertions : Hashes should match

testUser cp , rsync,
local / remote

ls
TestLogging

### Non-Functional
