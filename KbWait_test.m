KbQueueCreate
while true
    [secs, keyCode] = KbWait;
    find(keyCode)
    KbQueueFlush;
end