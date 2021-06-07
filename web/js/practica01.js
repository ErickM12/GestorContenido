var a = 1; //Variable de cualquier tipo (Esta manera ya no es remondable)
//String, int, boolean, float, long, char, double
//se setea automáticamente
let b = 2; //Variable de cualquier tipo
//String, int, boolean, float, long, char, double
//Espera a que concluya la petición o el proceso que este por encima para setearse.
const c = 3; // declaración de constantes 
//Las constantes no pueden cambiar su valor


const suma = function (a, b) {
    return a + b;
}
console.log(suma(1, 2));
console.log("Hola");

const rename = function (type) {
    if (type === 'MARVEL') {
        return 'IRON MAN';
    } else {
        return 'BATMAN';
    }
}



const multriplicar = (a, b) => a * b;
console.log(multriplicar(5, 5));

const bestTeam = (team) => {
    switch (team) {
        case 'barcelona':
            return`Tu equipo es ${team} felicidades es buen equipo`; 
        case 'real madrid':
            return`Tu equipo es ${team} felicidades es buen equipo, para que no te sientas`;
        default:
            return`No encontramos a tu equipo`;
    }
}
//JavaScript antiguo
const completeNameA = function (name, surname) {
    let age = 20;
    return "Tu nombre completo es: " + name + " " + surname;
}

//JavaScript moderno
const completeNameM = (name, surname) => `Tu nombre completo es: ${name} ${surname}`;

//JavaScript moderno

console.log(completeNameA('Erick', 'Mireles'));
console.log(completeNameM('Rodolfo', 'Campos'));
console.log(bestTeam('real madrid'));
