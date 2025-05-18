export function limpiarCaracteresEspeciales(texto: string) {
    return texto
        .normalize("NFD")
        .replace(/[\u0300-\u036f]/g, "") 
        .replace(/[^\u0020-\u007E]/g, ""); 
}
