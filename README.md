*This project has been created as part of the 42 curriculum by marudlof*

<a id="top"></a>

# libft — my own C library

- [libft — my own C library](#libft--my-own-c-library)
	- [Description](#description)
	- [Instructions](#instructions)
		- [Compilation](#compilation)
		- [Usage](#usage)
		- [Cleaning](#cleaning)
	- [Project Structure](#project-structure)
	- [Modules](#modules)
		- [Character checks](#character-checks)
		- [Memory](#memory)
		- [Strings](#strings)
		- [Printing](#printing)
		- [Math](#math)
		- [Linked lists](#linked-lists)
		- [Doubly linked lists](#doubly-linked-lists)
		- [Binary trees](#binary-trees)
	- [Technical Choices](#technical-choices)
	- [Notes](#notes)
	- [Resources](#resources)
	- [Development](#development)
	- [Author](#author)

-----

## Description

**libft** is a static C library written from scratch as part of the 42 curriculum. It reimplements a large part of the standard C library (`string.h`, `stdlib.h`, `ctype.h`) plus additional utilities that are reused across the rest of the cursus.

Beyond the mandatory scope, this version grew into a general-purpose toolbox: a `printf` implementation, singly and doubly linked lists, binary trees, and small math helpers.

Everything is implemented without calling the libc equivalents, and compiled with `-Wall -Wextra -Werror`.

-----

## Instructions

### Compilation

```bash
git clone <repo_url> libft
cd libft
make
```

This produces `libft.a` at the root of the project.

### Usage

Include the aggregate header and link against the archive:

```c
#include "libft.h"

int	main(void)
{
	char	**words;

	words = ft_split("hello world", ' ');
	ft_printf("%s / %s\n", words[0], words[1]);
	return (0);
}
```

```bash
cc main.c -Ipath/to/libft/includes -Lpath/to/libft -lft
```

Single modules can also be included directly if you don't want the whole library surface:

```c
#include "ft/string.h"
#include "ft/data/tree.h"
```

### Cleaning

```bash
make clean   # Remove object files (.objs/)
make fclean  # Remove object files and libft.a
make re      # Rebuild from scratch
```

[back to top](#top)

-----

## Project Structure

```
libft/
├── includes/
│   ├── libft.h         # Aggregate header
│   ├── ft_printf.h     # ft_printf / ft_dprintf
│   └── ft/
│       ├── math.h
│       ├── memory.h
│       ├── print.h
│       ├── string.h
│       └── data/
│           ├── list.h      # t_list   — singly linked list
│           ├── dblist.h    # t_stack  — doubly linked list
│           └── tree.h      # t_btree  — binary tree
├── srcs/
│   ├── check/          # ft_isalpha, ft_isdigit, ...
│   ├── memory/         # ft_memcpy, ft_calloc, ft_freeptr, ...
│   ├── string/         # ft_strlen, ft_split, ft_substr, ...
│   ├── print/          # ft_printf, ft_dprintf, ft_putnbr_base_fd, ...
│   ├── math/           # ft_sqrt, ft_isprime, ft_factorial, ...
│   ├── list/           # ft_lstnew, ft_lstadd_back, ...
│   ├── dblist/         # ft_dbnew, ft_dbadd_back, ...
│   └── tree/           # btree_create_node, btree_insert_data, ...
└── Makefile
```

[back to top](#top)

-----

## Modules

### Character checks

`ft_isalnum` · `ft_isalpha` · `ft_isascii` · `ft_isdigit` · `ft_isprint` · `ft_isspace`

Declared in `ft/string.h`.

### Memory

`ft_bzero` · `ft_calloc` · `ft_memchr` · `ft_memcmp` · `ft_memcpy` · `ft_memmove` · `ft_memset` · `ft_freeptr`

`ft_freeptr` frees a pointer **and** sets it to `NULL` through a `void **`, which avoids most double-free and dangling-pointer situations in the later projects.

### Strings

Conversion — `ft_atoi` · `ft_atol` · `ft_itoa`
Allocation — `ft_strdup` · `ft_substr` · `ft_strjoin` · `ft_strtrim` · `ft_split` · `ft_strmapi`
Measurement — `ft_strlen` · `ft_tabsize` · `ft_nbrlen_base` · `ft_unbrlen_base`
Copy — `ft_strlcpy` · `ft_strlcat`
Comparison — `ft_strcmp` · `ft_strncmp`
Search — `ft_strchr` · `ft_strrchr` · `ft_strnstr`
Misc — `ft_striteri` · `ft_tolower` · `ft_toupper`

`ft_tabsize` counts the entries of a `NULL`-terminated `void **` array (typically the output of `ft_split` or an `envp`).

### Printing

`ft_printf(const char *format, ...)` — writes to stdout, returns the number of characters printed.
`ft_dprintf(int fd, const char *format, ...)` — same, on an arbitrary file descriptor.

Supported conversions: `%c` `%s` `%p` `%d` `%i` `%u` `%x` `%X` `%%`. No flags, width, or precision.

Lower-level writers are available directly: `ft_putchar_fd` · `ft_putstr_fd` · `ft_putendl_fd` · `ft_putnbr_fd` · `ft_putnbr_base_fd` · `ft_putunbr_base_fd` · `ft_puthexa_fd` · `ft_putuhexa_fd`. They all return the number of bytes written, which is what makes the `printf` return value easy to accumulate.

### Math

`ft_abs` · `ft_sqrt` · `ft_power` · `ft_factorial` · `ft_fibonacci` · `ft_isprime` · `ft_nextprime`

Integer-only, no `libm` dependency.

### Linked lists

`t_list` — `content` + `next`.

`ft_lstnew` · `ft_lstadd_front` · `ft_lstadd_back` · `ft_lstlast` · `ft_lstsize` · `ft_lstiter` · `ft_lstmap` · `ft_lstdelone` · `ft_lstclear`

### Doubly linked lists

`t_stack` — `content` + `prev` + `next`.

`ft_dbnew` · `ft_dbadd_front` · `ft_dbadd_back` · `ft_dblast` · `ft_dbsize` · `ft_dbiter` · `ft_dbmap` · `ft_dbdelone` · `ft_dbclear`

Mirrors the `t_list` API, written for push_swap.

### Binary trees

`t_btree` — `content` + `left` + `right`.

`btree_create_node` · `btree_insert_data` · `btree_search_item` · `btree_level_count` · `btree_free`
Traversals — `btree_apply_prefix` · `btree_apply_infix` · `btree_apply_suffix` · `btree_apply_by_level`

Insertion and search take a `cmpf` comparison callback, so the tree stays agnostic of the stored type.

[back to top](#top)

-----

## Technical Choices

**Headers split by domain.** Rather than one flat `libft.h`, the API is cut into `ft/memory.h`, `ft/string.h`, `ft/print.h`, `ft/math.h` and `ft/data/*.h`. `libft.h` just aggregates them, so a project can either pull everything in or include only what it needs.

**Generic containers.** Lists and trees store `void *content` and take `del` / `f` / `cmpf` callbacks, which keeps them reusable across projects without touching the library.

**Base-aware number printing.** `ft_putnbr_base_fd` and `ft_unbrlen_base` are the shared foundation under `%d`, `%u`, `%x`, `%X` and `%p`, instead of one dedicated routine per conversion.

**Makefile.** Sources are declared per module and objects are mirrored into `.objs/`, keeping the source tree clean. The build prints a colored progress counter.

[back to top](#top)

-----

## Notes

A few things worth knowing before using the library:

- `libft.h` does **not** include `ft_printf.h` nor `ft/data/tree.h` — include those explicitly when you need `ft_printf`, `ft_dprintf`, or the binary trees.
- The power function is named `ft_power`, although its source file is `srcs/math/ft_pow.c`.
- `ft_printf` has no flag, width, or precision handling; it covers the conversions listed above only.

[back to top](#top)

-----

## Resources

- Linux man pages: `string(3)`, `printf(3)`, `malloc(3)`, `write(2)`
- [C reference — cppreference](https://en.cppreference.com/w/c)
- [42 Norm](https://github.com/42School/norminette)
- [Valgrind](https://valgrind.org/) — memory leak detection

[back to top](#top)

-----

## Development

| Prefix      | Usage               |
|-------------|---------------------|
| `feat/`     | New feature         |
| `fix/`      | Bug fix             |
| `refactor/` | Code refactoring    |
| `test/`     | Tests and debugging |
| `docs/`     | Documentation       |

This library is a living project: it is extended whenever a later 42 project needs a new utility.

[back to top](#top)

-----

## Author

- [marudlof](https://codeberg.org/Vusk)

*Built as part of the [42](https://42angouleme.fr/) curriculum.*
