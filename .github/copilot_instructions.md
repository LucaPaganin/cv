## Translations
- Remember to keep adjacent the translations for each language
    * The first translation is always the English one, followed by the Italian one.
    * divide the translations in topics, like location, organization, section, job, skill, education, publication, etc.
- DO NOT translate strings which do not differ in the various languages:
    * Cloud Backend Developer is the same in both languages, so it MUST NOT be translated.
    * Junior Full Stack Developer is the same in both languages, so it MUST NOT be translated.
    * Python or JavaScript are the same in both languages, so they MUST NOT be translated.
### Prefixes and naming conventions
- Use adequate 3 letters prefixes for each translation key, which must have an adequate level of specificity.
- There must be at most two level of nesting, going from left to right with increasing specificity.
- Use dashes '-' to separate words in the keys.
- Examples for first level:
    - sec for section and subsection titles
    - loc for location names
    - org for organization names
- Second level:
    - job for job experiences
    - skl for skills
    - edu for education
    - pub for publications
- Third level:


## Itemization
- Always use itemization with appropriate environment
    - use cventries for job experiences
    - use cvitems for skills
- DO NOT USE itemization when you describe an experience, like job or education experience
