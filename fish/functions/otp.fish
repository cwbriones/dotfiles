function otp --description "generate a OTP from your yubikey"
    ykman oath code (ykman oath accounts code | fzf | cut -d' ' -f1) | tr -s ' ' | cut -d ' ' -f2 | pbcopy
end
