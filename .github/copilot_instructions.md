## General
- YOU MUST NOT TRY TO COMPILE, I will do it.

## Translations
- Remember to keep adjacent the translations for each language
    * The first translation is always the English one, followed by the Italian one.
    * divide the translations in topics, like location, organization, section, job, skill, education, publication, etc.
- DO NOT translate strings which do not differ in the various languages:
    * Cloud Backend Developer is the same in both languages, so it MUST NOT be translated.
    * Junior Full Stack Developer is the same in both languages, so it MUST NOT be translated.
    * Python or JavaScript are the same in both languages, so they MUST NOT be translated.
    * Microsoft Azure is the same in both languages, so it MUST NOT be translated.
    * Microsoft Certified is the same in both languages, so it MUST NOT be translated.
- For section titles DO NOT USE translations, instead implement a conditional flow like the following
    ```
    \ifenglish
      \cvsection{Professional Experience}
    \else
      \ifitalian
        \cvsection{Esperienza Lavorativa}
      \fi
    \fi
    ```

- section titles translations are not needed

- Use basic translations whenever possible, otherwise re-use or define a new specific translation in cv-translations.sty
- whenever you need to define a new translation, follow the existing patterns in cv-translations.sty and define them in that file
- For translations, use the \GetTranslation{key} command to retrieve the translation key, like this:
    ```
    \GetTranslation{cer-az900-desc}
    ```
- For descriptions, avoid itemization when possible and create a single aggregate piece of text to be translated

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
    - cer for certifications



## Itemization
- Always use itemization with appropriate environment
    - use cventries for job experiences
    - use cvitems for skills
- DO NOT USE itemization when you describe an experience, like job or education experience
