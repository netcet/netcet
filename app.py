import streamlit as st
import PIL.Image
from io import BytesIO
from rembg import remove

def main():
    uploaded_file = st.file_uploader("Choose an image file")
    if uploaded_file is not None:
        output = None
        image = PIL.Image.open(uploaded_file)
        st.image(image, caption='Uploaded Image.', use_column_width=True)
        if st.button('Remove Background'):
            output = remove(image)
            st.image(output, caption='Output Image.', use_column_width=True)
        if st.button('Save Output Image'):
            output.save('out.png')
            st.write('Output image saved as out.png')

if __name__ == '__main__':
    main()