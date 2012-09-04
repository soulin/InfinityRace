//
//  ContactListener.m
//  Infinity race
//
//  Created by Maxim Cherkasov on 02.09.12.
//
//

#import "ContactListener.h"


ContactListener::ContactListener() : _contacts() {
}

ContactListener::~ContactListener() {
}

void ContactListener::BeginContact(b2Contact* contact) {
    // We need to copy out the data because the b2Contact passed in
    // is reused.
    Contact myContact = { contact->GetFixtureA(), contact->GetFixtureB() };
    _contacts.push_back(myContact);
}

void ContactListener::EndContact(b2Contact* contact) {
    Contact myContact = { contact->GetFixtureA(), contact->GetFixtureB() };
    std::vector<Contact>::iterator pos;
    pos = std::find(_contacts.begin(), _contacts.end(), myContact);
    if (pos != _contacts.end()) {
        _contacts.erase(pos);
    }
}

void ContactListener::PreSolve(b2Contact* contact,
                                 const b2Manifold* oldManifold) {
}

void ContactListener::PostSolve(b2Contact* contact,
                                  const b2ContactImpulse* impulse) {
}
