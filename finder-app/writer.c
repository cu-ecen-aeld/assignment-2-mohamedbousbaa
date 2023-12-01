#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    openlog("writer", LOG_PID, LOG_USER);

    if (argc < 3) {
        syslog(LOG_ERR, "Error: Insufficient arguments. Usage: %s <file> <string>", argv[0]);
        closelog();
        exit(EXIT_FAILURE);
    }

    const char *file_path = argv[1];
    const char *write_str = argv[2];

    FILE *file = fopen(file_path, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error: Unable to open file %s for writing.", file_path);
        closelog();
        exit(EXIT_FAILURE);
    }
	

    fprintf(file, "%s", write_str);
    fclose(file);
    printf("Le fichier %s a été créé avec succès avec le contenu %s \n" , file_path, write_str);
    syslog(LOG_DEBUG, "Writing '%s' to '%s'", write_str, file_path);

    closelog();
    return EXIT_SUCCESS;
}

