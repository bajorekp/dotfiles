receive-message() {
  QUEUE_NAME=$1

  case $QUEUE_NAME in
    *production | *production-deadletter)
      AWS_PROFILE=production
      ACCOUNT_ID=555911484621
      ;;
    *)
      AWS_PROFILE=sta
      ACCOUNT_ID=064764542321
      ;;
  esac
  
  QUEUE_URL="https://sqs.eu-west-1.amazonaws.com/$ACCOUNT_ID/$QUEUE_NAME"

  echo $AWS_PROFILE
  echo $QUEUE_URL

  aws sqs receive-message \
    --queue-url $QUEUE_URL \
    --visibility-timeout 30 \
    --wait-time-seconds 10 \
    --max-number-of-messages 10
}


purge-queue() {
  confirm && force-purge-queue $1
}


force-purge-queue() {
  QUEUE_NAME=$1

  case $QUEUE_NAME in
    *production | *production-deadletter)
      AWS_PROFILE=production
      ACCOUNT_ID=555911484621
      ;;
    *)
      AWS_PROFILE=sta
      ACCOUNT_ID=064764542321
      ;;
  esac
  
  QUEUE_URL="https://sqs.eu-west-1.amazonaws.com/$ACCOUNT_ID/$QUEUE_NAME"

  echo $AWS_PROFILE
  echo $QUEUE_URL

  aws sqs purge-queue --queue-url $QUEUE_URL;
}

confirm() {
    # call with a prompt string or use a default
    read "response?Are you sure? [y/N] "
    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

