#!/usr/bin/env python
# coding: utf-8

# In[ ]:


from vertexai.language_models import TextGenerationModel


# In[2]:


generation_model = TextGenerationModel.from_pretrained("text-bison@001")


# In[3]:


toptr = {"Suggest a name for a flower shop that sells bouquets of dried flowers",
"Generate a list of ways that makes Earth unique compared to other planets",
"Why is the sky blue?",
"Who was the first elephant to visit the moon?",
"I'm a high school student. Recommend me a programming activity to improve my skills.",
"""I'm a high school student. Which of these activities do you suggest and why:
a) learn Python
b) learn Javascript
c) learn Fortran
""",
"""Decide whether a Tweet's sentiment is positive, neutral, or negative.

Tweet: I loved the new YouTube video you made!
Sentiment:
""",
"""Decide whether a Tweet's sentiment is positive, neutral, or negative.

Tweet: I loved the new YouTube video you made!
Sentiment: positive

Tweet: That was awful. Super boring 😠
Sentiment:
""",
"What is a large language model?",
"What are the top 10 trends in the tech industry?",
"""
Extract the technical specifications from the text below in JSON format.

Text: Google Nest WiFi, network speed up to 1200Mpbs, 2.4GHz and 5GHz frequencies, WP3 protocol
JSON: {
  "product":"Google Nest WiFi",
  "speed":"1200Mpbs",
  "frequencies": ["2.4GHz", "5GHz"],
  "protocol":"WP3"
}

Text: Google Pixel 7, 5G network, 8GB RAM, Tensor G2 processor, 128GB of storage, Lemongrass
JSON:
"""}


# In[ ]:


for i in toptr:
   answer = generation_model.predict(prompt=i, max_output_tokens=256)
   print(answer.text)
#   print(i)

