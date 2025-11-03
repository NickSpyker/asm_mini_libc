/*
 * Copyright 2025 Nicolas Spijkerman
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <dlfcn.h>
#include <stdio.h>

int error_handler(char *error, void *handle, char *fn)
{
    if (error == NULL) return 1;
    printf("- MISSING %s !\n", fn);
    dlclose(handle);
    return 0;
}

int main(void)
{
    void *handle = NULL;
    handle = dlopen("./libasm.so", RTLD_LAZY);
    if (handle == NULL) {
        fprintf(stderr, "%s\n", dlerror());
        return 84;
    }

    size_t (*strlen)(const char *) = dlsym(handle, "strlen");
    if (error_handler(dlerror(), handle, "strlen")) {
        if (strlen("Hello, World !\n") == 15) printf("- strlen work !\n");
        else printf("- ERROR with strlen !\n");
    }

    char (*strchr)(const char *, int) = dlsym(handle, "strchr");
    if (error_handler(dlerror(), handle, "strchr")) {
        char str[] = "Hello, world !";
        char *p = strchr(str, 'w');
        if (p != NULL) {
            printf("- strchr work !\n");
        } else {
            printf("- ERROR with strchr !\n");
        }
    }

    dlclose(handle);
    return 0;
}
