from operator import attrgetter


def print_logo(app):
    print(

        """
            \033[1;34m
    
            
                                    __       __  ____
                   ____  __________/ /______/ /_/ __/
                  / __ \/ ___/ ___/ __/ ___/ __/ /_  
                 / / / / /__(__  ) /_/ /__/ /_/ __/  
                /_/ /_/\___/____/\__/\___/\__/_/     
                                                     

    \033[0m
        """
    )
    all_methods = True
    sort = 'endpoint'
    rules = list(app.url_map.iter_rules())
    ignored_methods = set(() if all_methods else ("HEAD", "OPTIONS"))

    if sort in ("endpoint", "rule"):
        rules = sorted(rules, key=attrgetter(sort))
    elif sort == "methods":
        rules = sorted(rules, key=lambda rule: sorted(rule.methods))  # type: ignore

    rule_methods = [
        ", ".join(sorted(rule.methods - ignored_methods))  # type: ignore
        for rule in rules
    ]
    headers = ("Endpoint", "Methods", "Rule")
    widths = (
        max(len(rule.endpoint) for rule in rules),
        max(len(methods) for methods in rule_methods),
        max(len(rule.rule) for rule in rules),
    )
    widths = [max(len(h), w) for h, w in zip(headers, widths)]
    row = "             {{0:<{0}}}  {{1:<{1}}} {{2:<{2}}}".format(*widths)

    print(row.format(*headers))
    print(row.format(*("-" * width for width in widths)))
    for rule, methods in zip(rules, rule_methods):
        print(row.format(rule.endpoint, methods, rule.rule).rstrip())
    print('\n')

    if app.config.get("SECRET_KEY") == 'pearadminflask':
        print("             \033[1;31m密钥尚未更改，请部署前在.flaskenv中更改密钥\033[0m")
        print('\n')
