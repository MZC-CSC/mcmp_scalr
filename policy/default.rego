package main

# 규칙 1: name이 "John"인 사용자에게만 접근 권한을 부여
default allow = false
allow {
    input.name == "John"
}

# 규칙 2: score가 90 이상인 경우 "Pass", 그렇지 않으면 "Fail"을 반환
score_status[score] {
    score >= 90
    score_status = "Pass"
}
score_status[score] {
    score < 90
    score_status = "Fail"
}
