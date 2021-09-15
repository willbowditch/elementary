![](static/headline-git.png)

Elementary is an open-source data reliability framework for modern data teams.
The first module of the framework is data lineage.

**Data lineage made simple, reliable, and automated.**  
Open-source tool to effortlessly track the flow of data, understand dependencies and analyze impact.

![](static/Demo_elementary.gif)


## Features

* **Visualization:** In browser visual representation of the data lineage graph. 
* **DWH lineage:** Effortlessly map data flow in the data warehouse. 
* **Accuracy:** Reflects the actual state in the DWH.
* **Plug-and-play:** No need for code changes.

**Coming soon:**

* **Monitoring:** Present data about freshness, volume and schema on the lineage graph.
* **Lineage history:** Store data about lineage versions and changes.
* **Column level lineage:** Add column-level granularity.
* **Full lineage:** Integrate with downstream and upstream tools to create a full graph.

## Quick start

```bash
pip install elementary-lineage

# The tool is named edl (Elementary Data Lineage),
# run it to validate the installation:
edl --help
```

Now we need a connection file in a simple YAML called `profiles.yml`.   
If you don't use dbt, go to our [quickstart page](https://docs.elementary-data.com/quickstart#requirements) for instructions on how to create it. 

If you use ![](static/dbt-16.png)[dbt](https://www.getdbt.com/), you can start right away by running this command with the path to your `profiles.yml` and the relevant profile name:

```bash
edl -d ~/.dbt -p <profile_name>
```

If you like what we are building, support us with [![](static/star.png)](https://github.com/oravi/lineage/stargazers)

## Documentation

Our full documentation is [available here](https://docs.elementary-data.com/).

## Community & Support

For additional information and help, you can use one of these channels:

* ![](static/slack-16.png) [Slack](https://join.slack.com/t/elementary-community/shared_invite/zt-uehfrq2f-zXeVTtXrjYRbdE_V6xq4Rg) \(live chat with the team, feature requests, community support, discussions, etc.\)
* 📧Contact us directly at [team@elementary-data.com](mailto:team@elementary-data.com)

## **Integrations**

* [x] **Snwoflake** ![](static/snowflake-16.png)
* [ ] **BigQuery**  ![](static/bigquery-16.png) 
* [ ] **Redshift**  ![](static/redshift-16.png) 

Ask us for integrations on [Slack](https://join.slack.com/t/elementary-community/shared_invite/zt-uehfrq2f-zXeVTtXrjYRbdE_V6xq4Rg) or as a Github issue.

## **License**

Elementary lineage is licensed under Apache License 2.0. See the LICENSE file for licensing information.
