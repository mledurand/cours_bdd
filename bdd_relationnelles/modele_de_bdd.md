# Modèles de Bases de Données

### Définitions clés

- Base de données (DB) : Collection organisée d'informations.
- Système de gestion de base de données (SGBD / DBMS) : Logiciel permettant de créer, gérer et interagir avec une base de données.

### Le SGBD fournit :
- Une interface pour les utilisateurs.
- Des outils pour organiser et superviser les données.

---

## Types de modèles

### 1. Modèle relationnel
- Structure en tables avec des relations entre elles.
- Utilise le langage SQL pour interroger et manipuler les données.
- Exemples de SGBD : PostgreSQL, MySQL, Oracle Database.

### 2. Modèle non relationnel (NoSQL)
- Structure plus flexible, adaptée aux données non tabulaires.
- Types principaux :
  - Magasins de documents (ex : MongoDB)
  - Bases orientées colonnes (ex : Cassandra)
  - Magasins clé-valeur (ex : Redis)
  - Bases de graphes (ex : Neo4j)

### 3. Modèle multi-modèle
- Combine plusieurs types de structures (relationnel + NoSQL).


---

## À retenir

- Il n’existe pas de modèle universel : le choix dépend du type de données et des besoins du projet.
- Les bases relationnelles sont idéales pour des données bien structurées.
- Les bases NoSQL sont plus adaptées aux données volumineuses ou non structurées.


Base de données (BD) : ensemble organisé d’informations stockées et accessibles.  
Système de gestion de base de données (SGBD) : logiciel qui crée, lit, met à jour et supprime les données, et fournit des mécanismes d’accès, de sécurité et d’administration.

---

Principaux types de modèles

- Relationnel  
  - Données organisées en tables (lignes/colonnes)  
  - Relations exprimées par clés et jointures  
  - Convient aux schémas structurés, intégrité référentielle et requêtes SQL

- NoSQL non relationnel  
  Regroupe plusieurs modèles optimisés pour la flexibilité et la scalabilité horizontale :  
  - Document : enregistrements stockés sous forme de documents (souvent JSON) ; schéma flexible  
  - Clé‑valeur : paires clé → valeur simples ; accès très rapide  
  - Colonnes larges : familles de colonnes, lignes dynamiques ; adapté au big data  
  - Graphe : nœuds et arêtes avec propriétés ; optimisé pour parcours relationnels

---

Exemple conceptuel étudiant

- Relationnel : table student (id, name, surname, age) ; relations via clés étrangères  
- Document : collection students ; chaque document JSON contient id, name, surname, age et champs imbriqués (adresses, groupes)  
- Clé‑valeur : clé student:123 → valeur = sérialisation de l’étudiant  
- Colonne large : ligne identifiée par id avec colonnes dynamiques pour attributs et historiques  
- Graphe : nœud Student lié à nœuds Course, Group par arêtes

---

Comparatif par type avec exemples

| Type | Structure | Cas d’usage typiques | Exemples |
|---|---:|---|---|
| Relationnel | Tables relationnelles; schéma fixe | Transactions ACID, reporting, ERP | PostgreSQL; MySQL; Oracle Database; SQL Server |
| Document | Documents JSON/BSON dans des collections | API backends, données semi-structurées | MongoDB; CouchDB; Couchbase |
| Clé‑valeur | Paires clé → valeur | Caches, sessions, configuration | Redis; Amazon DynamoDB |
| Colonnes larges | Familles de colonnes; lignes dynamiques | Ingestion massive, séries temporelles | Apache Cassandra; HBase |
| Graphe | Nœuds et arêtes avec propriétés | Réseaux sociaux, recommandations | Neo4j; JanusGraph |

> Remarque : certains SGBD sont multi‑modèles et combinent paradigmes (ex. ArangoDB, Couchbase, Oracle).

---

Rappel rapide

- Aucun modèle n’est universel ; le choix dépend des besoins métier, de la cohérence requise et de la scalabilité souhaitée.  
- Relationnel = contraintes fortes et requêtes SQL complexes.  
- NoSQL = flexibilité et optimisation selon le modèle choisi.

---

Exemple JSON pour illustrer une base document

`json
{
  "id": "student-123",
  "name": "Aïcha",
  "surname": "Diop",
  "age": 24,
  "email": "aicha.diop@example.com",
  "addresses": [
    {
      "type": "home",
      "street": "12 rue des Fleurs",
      "city": "Paris",
      "postal_code": "75001"
    }
  ],
  "groups": [
    {
      "group_id": "BG1",
      "role": "member"
    }
  ],
  "enrollments": [
    {
      "course_id": "CS101",
      "year": 2025,
      "grade": "A"
    }
  ],
  "metadata": {
    "created_at": "2025-11-09T15:47:00Z",
    "last_updated": "2025-11-01T09:30:00Z"
  }
}
`

---

Tableau illustrant un enregistrement relationnel

| id | name | surname | age | email |
|---:|---|---|---:|---|
| 123 | Aïcha | Diop | 24 | aicha.diop@example.com |

- Dans un schéma relationnel complet, des tables séparées contiendraient addresses, groups et enrollments liées par des clés étrangères (student_id) au lieu d’être imbriquées dans le même enregistrement.