db.getSiblingDB('unifi-db').createUser({
  user: 'unifi',
  pwd: 'pass',
  roles: [{ role: 'dbOwner', db: 'unifi-db' }],
});
db.getSiblingDB('unifi-db_stat').createUser({
  user: 'unifi',
  pwd: 'pass',
  roles: [{ role: 'dbOwner', db: 'unifi-db_stat' }],
});
