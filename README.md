# 🛡️ 25-1 Capstone Project


## 🌐 프로젝트 배경 및 목표

최근 많은 기업과 공공기관이 **On-premise** 시스템에서 클라우드 환경으로 전환하면서, 데이터 유연성과 확장성은 강화되었지만 보안 위협도 더욱 증가하고 있습니다.  
특히 하이브리드·원격 근무 모델의 확산과 정교한 사이버 공격으로 인해 전통적인 경계 기반 보안 모델은 한계를 드러내고 있습니다.

이에 본 프로젝트는 **제로트러스트(Zero Trust) 보안 모델**을 Kubernetes 기반으로 실제 구현하여, **실시간 위협 탐지 및 대응**이 가능한 환경을 시뮬레이션하고, 클라우드 및 온프레미스 환경을 연계하는 보안 전략을 검증하는 것을 목표로 합니다.


## 📝 프로젝트 개요

본 프로젝트는 **보안 부서(Security Department)**를 위한 컨테이너화된 보안 환경을 Docker와 Kubernetes 기반으로 설계 및 구축하기 위한 캡스톤 디자인 과제입니다.  
컨테이너별 보안 요소를 분리하고, 네트워크 정책과 보안 게이트웨이, 스위치를 포함하여 **제로트러스트 환경**을 시뮬레이션합니다.


## 🔒 주요 보안 기능

- ✅ **MFA (Multi-Factor Authentication)**: 다중 인증을 통해 무단 접근을 방지
- ✅ **SSO (Single Sign-On)**: 한 번의 로그인으로 여러 서비스 접근
- ✅ **RBAC (Role-Based Access Control)**: 사용자 역할 기반 최소 권한 접근 제어
- ✅ **IDS (Suricata 기반 Intrusion Detection System)**: 네트워크 트래픽 실시간 분석 및 탐지
- ✅ **Proxy**: 네트워크 트래픽 필터링 및 제어
- ✅ **ELK 스택**: 로그 수집 및 실시간 모니터링 (Logstash, Elasticsearch, Kibana).


## 🛠️ 주요 구성 요소


### 🐳 Docker

- **container_control**: 보안 부서 내 개별 컨테이너 제어 디렉토리 (security01~10, gateway, switch)
- **image**: 베이스 이미지 및 개발용 스크립트


### Docker Compose

- 여러 컨테이너를 동시에 오케스트레이션하기 위한 docker-compose 설정


### ☸️ Kubernetes

- **configmap**: 설정 파일 관리
- **container_control**: Pod, Service, NetworkPolicy 등 보안 컨트롤 구성
- **deployments**: Pod 배포 설정
- **multus-networks**: 멀티 네트워크 환경 지원
- **rbac, serviceaccount**: 권한 및 계정 관리
- **suricata/rules**: Suricata IDS/IPS 룰 관리
- **start_setup**: 초기 배포 및 네트워크 설정 스크립트


## 💡 핵심 기능 요약

- ✅ **보안 컨테이너 분리 실행**: security01 ~ security10 개별 이미지 및 실행
- ✅ **보안 게이트웨이 & 스위치 컨테이너**: 트래픽 제어 및 라우팅
- ✅ **Suricata 기반 IDS/IPS**: 위협 탐지 및 대응 룰 포함
- ✅ **Kubernetes 기반 제어**: RBAC, NetworkPolicy, ServiceAccount 등 보안 정책 적용
- ✅ **멀티 네트워크(Multus) 구성**: 각 Pod에 다중 NIC 연결 가능


## 🚀 설치 및 실행 방법


### Docker 기반 실행

```bash
cd docker/container_control/Security_department/security01
docker build -t security01 .
docker run --name security01_container security01
```


## ⚡ 테스트 및 성능 평가

- 평균 탐지 시간: **40초 이내**
- Suricata IDS를 통해 실시간 위협 탐지 및 알림 기능 검증
- 유효하지 않은 토큰 접근 탐지 및 자동 차단
- 이상 접근 시 Slack/Email 자동 경고 기능 정상 작동
- Proxy 기반 지속적 트래픽 검증과 NetworkPolicy 기반 대응 검증 완료


## 🔭 향후 연구 및 발전 방향

- 금융 규제 및 컴플라이언스 자동화 프레임워크 개발
- AWS WAF와 Suricata 이벤트 교차 상관 분석
- 멀티 VPC 연동 및 AWS 네이티브 서비스와의 통합 강화