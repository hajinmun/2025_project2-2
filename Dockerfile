# Stage 1: Maven 빌드
FROM maven:3.8-openjdk-11 AS build

WORKDIR /app

# pom.xml과 wrapper 복사
COPY pom.xml .
COPY .mvn .mvn
COPY mvnw .

# 의존성 다운로드 (캐시 활용)
RUN mvn dependency:go-offline -B

# 소스 코드 복사
COPY src ./src

# 빌드 (테스트 스킵)
RUN mvn clean package -DskipTests

# Stage 2: Tomcat 실행
FROM tomcat:9.0-jdk11-temurin

# 불필요한 앱 제거
RUN rm -rf /usr/local/tomcat/webapps/*

# WAR 파일 복사
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# 포트 설정
EXPOSE 8080

# 환경변수 설정 (선택사항)
ENV JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom"

# Tomcat 실행
CMD ["catalina.sh", "run"]