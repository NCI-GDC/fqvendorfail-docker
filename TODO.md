# TODO List For New Repo

## Developer

- [ ] Create new branch off `main` named `repo-init`
 - [ ] `git checkout -b repo-init`
- [ ] Update top-level `Makefile` with name of Github repo
- [ ] Update `1.2.3/` to a version of the software to be built
  - [ ] Example: `git mv 1.2.3/ 1.0.0/`
- [ ] Ensure `# TODO` comments addressed
- [ ] Commit and push changes
- [ ] Contact admin (Charles) for next steps

## Admin

- [ ] Create quay repo(s)
- [ ] Update repo permissions:
  - [ ] `biodev` group with read
  - [ ] `gdcbioadmin` group with admin
  - [ ] `ncigdc+gdcrobot` bot user with write
  - [ ] `ncigdc+cdisbackupbot` bot user with read
- [ ] `mv travis.yml .travis.yml`
- [ ] Add encrypted travis creds
