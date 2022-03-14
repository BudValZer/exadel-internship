# This file will mention tasks, the solution of which is not obvious or require some notes

# 2. Install necessary plugins (if you need).

`Docker` and `Docker Pipeline` plugins were used.

# 3. Configure several (2-3) build agents. Agents must be run in docker.

Docker cloud was configured on Jenkins using GUI. Custom jenkins agent image was build by ansible
(check build_jenkins_agent role for more info) and put into local docker registry (LDR).
Note that this isn\`t the universal image and it\`s main purpose was to run docker commands.

# 6. Create Pipeline, which will build artifact using Dockerfile directly from your github repo (use Dockerfile from previous task).

To make this task more convenient, another <a href="https://github.com/BudValZer/task6_source.git">GitHub repo</a> was created to store project in one place.

# 7. Pass  variable PASSWORD=QWERTY! To the docker container. Variable must be encrypted!!!

This step was also made in the before-mentioned project, variable `SECRET` is stored in ansible credentials as `Secret text`

# 4. Configure integration between Jenkins and your Git repo. Jenkins project must be started automatically if you push or merge to master, you also must see Jenkins last build status(success/unsuccess) in your Git repo.

The webhook for this step was also done on alternative repo.