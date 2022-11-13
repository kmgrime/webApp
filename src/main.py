import altair as alt
import math
import pandas as pd

from PIL import Image
import streamlit as st

st.set_page_config(page_title="Webpage101", page_icon=":coffee:", layout="wide")

# assets
img_code = Image.open("/images/code.jpg")

# HEADER
with st.container():
    st.subheader("Hi, welcome to the landing page :wave:")
    st.title("Python webapp")
    st.write("Test app to be used in software and Infrastructure as Code deliveries.")
    st.write("[GitHub repo](https://www.github.com/kmgrime)")

# about
with st.container():
    st.write("---")
    left_column, right_column = st.columns(2)
    with left_column:
        st.header("About")
        st.write(
            """
            - String1
            - string2
            """
            )
        st.write("[Test link](https://example.com)")


# Projects
with st.container():
    st.write("---")
    st.header("My Projects")
    st.write("##")
    image_column, text_column = st.columns((1, 2))
    with image_column:
        st.image(img_code)
    with text_column:
        st.subheader("Building the test app")
        st.write(
        """
        Example of code used in the testapp for illustration
        """
        )
        st.markdown("[readme](https://github.com/kmgrime)")