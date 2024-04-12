import { useState, useEffect } from 'react';

const Spinner = () => {
    const [index, setIndex] = useState<number>(0);
    const dots: string[] = ['⠾', '⠽', '⠻', '⠟', '⠯', '⠷',];

    useEffect(() => {
        const interval = setInterval(() => {
            setIndex((prevIndex) => (prevIndex + 1) % dots.length);
        }, 150); // Change the interval duration as needed

        return () => clearInterval(interval);
    }, []);

    return (
        <div>
            {dots[index]} BUILDING
        </div>
    );
};

export default Spinner;

