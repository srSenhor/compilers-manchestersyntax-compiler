class Token
{
private:
    int value;
    int ocurrency;

public:
    Token(int value);
    ~Token();
    void increment();
    inline int getValue() { return this->value; }
    inline int getOcurrency() { return this->ocurrency; }
};
