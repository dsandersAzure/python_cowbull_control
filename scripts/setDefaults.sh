function setDefaults {
    USAGE_STRING="usage: deploy [azure|google|minikube] [-abcdghlmnpqrtDFSCT] "
    USAGE_STRING=$USAGE_STRING"["
    USAGE_STRING=$USAGE_STRING"--agents|"
    USAGE_STRING=$USAGE_STRING"--disk-size|"
    USAGE_STRING=$USAGE_STRING"--mini-cpu|"
    USAGE_STRING=$USAGE_STRING"--group group name|"
    USAGE_STRING=$USAGE_STRING"--location|"
    USAGE_STRING=$USAGE_STRING"--masters(deprecated)|"
    USAGE_STRING=$USAGE_STRING"--dns-name|"
    USAGE_STRING=$USAGE_STRING"--pip-name|"
    USAGE_STRING=$USAGE_STRING"--mini-ram|"
    USAGE_STRING=$USAGE_STRING"--machine-type"
    USAGE_STRING=$USAGE_STRING"]"

    PARSED=""
    GET_CONTEXT_ONLY=""
    EXEACS=0
    EXEAZURE=0
    EXEGOOGLE=0
    EXEMINIKUBE=0
    EXEDOCKER=0
    EXEKUBE=0
    DATEFILL=$(date +"%m%d%y")
    GROUP="dasander"${DATEFILL}
    MASTER_COUNT=1
    AGENT_COUNT=1
    LOCATION="**notset**"
    MACHINE_TYPE="**notset**"
    DNS_PREFIX="dnsprefix"
    PIP_NAME="cowbull-azure"
    DEBUG=0
    DRYRUN=0
    KEYFILE=~/.ssh/id_rsa
    QUIET=0
    START_AT=1
    DISK_SIZE=100
    MINIRAM=5192
    MINICPU=4
    DEPLOYCLUSTER=0
    DEPLOYSERVICES=0
    DEPLOYFULL=1
    TEARDOWN=0
    MONGODB=0
    VENDOR_SELECTED=0
    VENDOR_PATH="vendor/minikube"
    INGRESS=0
    GCPSTORAGE=0
    DOCKER_PROJECT="cowctl"
    DOCKER_FILENAME="/tmp/"$(date +"%H%M%S%N")".yml"
    REDIS_REPLICAS=3
    REDIS_LAST_NODE=$(($REDIS_REPLICAS - 1))

    SHIFT_AMOUNT=0
    ERROR_TEXT=""

    EXPERIMENTS=0

    export DOLLAR='$'
    TEMP=$(uname -a | grep arm)
    if [[ $TEMP"X" == "X" ]];
    then
        export TAGS=":latest"
        export REPO=""
        export REPOV6=""
        export REDIS_TAGS=":4.0.6"
    else
        export TAGS=":latest-arm32" # Set images to pull arm
        export REPO="arm32v7/"
        export REPOV6="arm32v6/"
        export REDIS_TAGS=":4.0.6-arm32v7"
    fi
    export REDIS_REPLICAS
    export REDIS_LAST_NODE
}
