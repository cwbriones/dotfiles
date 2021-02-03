function otp --description "generate a OTP from your yubikey"
    ykman oath code (ykman oath list | fzf) | tr -s ' ' | cut -d ' ' -f2 | pbcopy
end
