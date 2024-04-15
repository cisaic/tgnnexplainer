import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setup_requires = ['pytest-runner']
tests_require = ['pytest', 'pytest-cov', 'mock']

setuptools.setup(
    name="T-GNNExplainer",
    version=1.0,
    license="GPLv3",
    description="T-GNNExplainer: Explaining Temporal Graph Models through an Explorer-Navigator Framework",
    long_description=long_description,
    long_description_content_type="text/markdown",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: GNU General Public License v3 (GPLv3)",
        "Operating System :: OS Independent",
    ],
    install_requires=['scipy',
                      'cilog',
                      'typed-argument-parser==1.5.4',
                      'captum==0.2.0',
                      'shap',
                      'IPython',
                      'tqdm',
                      'rdkit-pypi',
                      'pandas',
                      'sympy',
                      'hydra-core'],
    python_requires='>=3.6',
    setup_requires=setup_requires,
    tests_require=tests_require,
    extras_require={'test': tests_require},
    include_package_data=True
)
