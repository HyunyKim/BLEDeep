## BLE Deep 

1. 리스트 형으로 만들어서 세부 정보 까지 생각해 본다.
2. 가능한 부분을 모두 시도해보고 기록하자
3. 단순히 업무만을 위한 방향이 아니라 이건 공부다. 
4. 먼저 스캐닝에 대한 공부를 하기 위해서
특정시간 수집된 장비들의 정보를 모드 파헤치자



### Setup
1. Background Modes 
- Act as a Bluetooth LE accessory
- Uses Bluetooth LE accessories
2. BlueTooth : Description
3. BlueTooth(While in Use) : Description
4. BLEServiceable 작성
-> 스캔/광고 매니저 등록
-> 블루투스 권한 체크
-> Service는 PeerListView가 가지고 있는다. 





## 요구사항
- 주변에 블루투스로 광고 하는 사람을 모두 찾아 리스트업 한다. 
- 가져올 수 있는 정보를 확인하고 리스트업 한다.

## memo

CBPeripheral의 정보중에 어느 정보를 화면을 위해서 가져올 수 있을지 고민해보자.

지금 부터 정말 스캔에 대해서 구현을 해야 함.
5초 스캔해서 모은 정보를 모두 활용해 보자.  

