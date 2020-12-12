CREATE TABLE decks (
        deck_id serial,
        user_id int NOT NULL,
        name varchar NOT NULL,
        correct boolean,
        CONSTRAINT PK_deck PRIMARY KEY (deck_id),
        CONSTRAINT FK_user FOREIGN KEY(user_id) REFERENCES users(user_id)
);
CREATE TABLE cards (
        card_id serial,
        deck_id int NOT NULL,
        user_id int NOT NULL,
        question varchar NOT NULL,
        answwer varchar NOT NULL,
        correct boolean,
        
        CONSTRAINT PK_card PRIMARY KEY (card_id),
        CONSTRAINT FK_deck FOREIGN KEY(deck_id) REFERENCES decks(deck_id),
        CONSTRAINT FK_user FOREIGN KEY(user_id) REFERENCES users(user_id)
); 
//run these in order one by one
ALTER TABLE decks ADD COLUMN rank int CONSTRAINT max_rank CHECK (rank <= 100);//max 100
ALTER TABLE ONLY decks ALTER COLUMN rank SET DEFAULT 0;//default zero

ALTER TABLE cards ADD COLUMN rank int CONSTRAINT max_rank CHECK (rank <= 5);//max is 5
ALTER TABLE ONLY cards ALTER COLUMN rank SET DEFAULT 0;//default is zero

ALTER TABLE decks ADD COLUMN description varchar;
//sets correct to null instead of hardcoded false
ALTER TABLE ONLY decks ALTER COLUMN correct SET DEFAULT null;
//fixes spelling error
ALTER TABLE cards RENAME COLUMN answwer TO answer; 







 

INSERT INTO cards (card_id, deck_id, user_id, question, answer, correct, rank) VALUES (DEFAULT, 3, 4, 'whats up?', 'chillin', default, default);
SELECT deck_id, card_id, question, answwer, correct FROM cards WHERE user_id = 4 AND deck_id = 3 AND correct = false;
DELETE FROM cards WHERE user_id = 4 AND deck_id = 3 AND card_id = 1;