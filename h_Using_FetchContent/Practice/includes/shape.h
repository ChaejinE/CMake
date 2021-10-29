#include "color.h"

class Rectangle {
    public:
        Rectangle(int width, int height);
        int GetSize() const;
        void SetColor(Color color);

    private:
        int width_, height_;
        Color color_;
};
