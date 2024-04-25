List<Map<String, dynamic>> notifications(String language) => [
  for (var notification in _notifications)
    {
      'description': language == 'eng' ? notification['eng_description'] : notification['guj_description'],
      'image': notification['image'],
    }
];

final _notifications = [
  {
    'eng_description': 'Here the Price at jamjodhpur Marketing yard',
    'guj_description': 'અહીં જામજોધપુર માર્કેટિંગ યાર્ડમાં ભાવ',
    'image': 'assets/notification_1.jpg',
  },
  {
    'eng_description': 'Some new info',
    'guj_description': 'થોડી નવી માહિતી',
    'image': 'assets/notification_2.jpg',
  },
  {
    'eng_description': 'Alert',
    'guj_description': 'ચેતવણી',
    'image': 'assets/notification_3.jpg',
  },
  {
    'eng_description': 'Find the attachment',
    'guj_description': 'જોડાણ શોધો',
    'image': 'assets/notification_4.jpg',
  },
  {
    'eng_description': 'Monsoon Update',
    'guj_description': 'ચોમાસા ની જાણકારી',
    'image': 'assets/notification_5.jpg',
  },
  {
    'eng_description': 'News Update',
    'guj_description': 'જાણકારી',
    'image': 'assets/notification_6.jpg',
  },
  {
    'eng_description': 'Info To Know',
    'guj_description': 'જાણવા જેવું',
    'image': 'assets/notification_7.jpg',
  },
  {
    'eng_description': 'Heat Wave',
    'guj_description': 'ગરમી ની લહેર',
    'image': 'assets/notification_8.jpg',
  },
  {
    'eng_description': 'Skymet weather forcast',
    'guj_description': 'Skymet Weather Forcast',
    'image': 'assets/notification_8.jpg',
  },
];
