{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "a0f53ce0",
   "metadata": {},
   "outputs": [],
   "source": [
    "import pandas as pd\n",
    "import scipy \n",
    "import numpy as np\n",
    "from scipy import stats"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "9f801c53",
   "metadata": {},
   "outputs": [],
   "source": [
    "lab=pd.read_csv(\"LabTAT.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "f924535d",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>Laboratory 1</th>\n",
       "      <th>Laboratory 2</th>\n",
       "      <th>Laboratory 3</th>\n",
       "      <th>Laboratory 4</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>185.35</td>\n",
       "      <td>165.53</td>\n",
       "      <td>176.70</td>\n",
       "      <td>166.13</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>170.49</td>\n",
       "      <td>185.91</td>\n",
       "      <td>198.45</td>\n",
       "      <td>160.79</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>192.77</td>\n",
       "      <td>194.92</td>\n",
       "      <td>201.23</td>\n",
       "      <td>185.18</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>177.33</td>\n",
       "      <td>183.00</td>\n",
       "      <td>199.61</td>\n",
       "      <td>176.42</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>193.41</td>\n",
       "      <td>169.57</td>\n",
       "      <td>204.63</td>\n",
       "      <td>152.60</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   Laboratory 1  Laboratory 2  Laboratory 3  Laboratory 4\n",
       "0        185.35        165.53        176.70        166.13\n",
       "1        170.49        185.91        198.45        160.79\n",
       "2        192.77        194.92        201.23        185.18\n",
       "3        177.33        183.00        199.61        176.42\n",
       "4        193.41        169.57        204.63        152.60"
      ]
     },
     "execution_count": 13,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "lab.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "58bd5dfc",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>Laboratory 1</th>\n",
       "      <th>Laboratory 2</th>\n",
       "      <th>Laboratory 3</th>\n",
       "      <th>Laboratory 4</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>count</th>\n",
       "      <td>120.000000</td>\n",
       "      <td>120.000000</td>\n",
       "      <td>120.000000</td>\n",
       "      <td>120.00000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>mean</th>\n",
       "      <td>178.361583</td>\n",
       "      <td>178.902917</td>\n",
       "      <td>199.913250</td>\n",
       "      <td>163.68275</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>std</th>\n",
       "      <td>13.173594</td>\n",
       "      <td>14.957114</td>\n",
       "      <td>16.539033</td>\n",
       "      <td>15.08508</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>min</th>\n",
       "      <td>138.300000</td>\n",
       "      <td>140.550000</td>\n",
       "      <td>159.690000</td>\n",
       "      <td>124.06000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>25%</th>\n",
       "      <td>170.335000</td>\n",
       "      <td>168.025000</td>\n",
       "      <td>188.232500</td>\n",
       "      <td>154.05000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>50%</th>\n",
       "      <td>178.530000</td>\n",
       "      <td>178.870000</td>\n",
       "      <td>199.805000</td>\n",
       "      <td>164.42500</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>75%</th>\n",
       "      <td>186.535000</td>\n",
       "      <td>189.112500</td>\n",
       "      <td>211.332500</td>\n",
       "      <td>172.88250</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>max</th>\n",
       "      <td>216.390000</td>\n",
       "      <td>217.860000</td>\n",
       "      <td>238.700000</td>\n",
       "      <td>205.18000</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "       Laboratory 1  Laboratory 2  Laboratory 3  Laboratory 4\n",
       "count    120.000000    120.000000    120.000000     120.00000\n",
       "mean     178.361583    178.902917    199.913250     163.68275\n",
       "std       13.173594     14.957114     16.539033      15.08508\n",
       "min      138.300000    140.550000    159.690000     124.06000\n",
       "25%      170.335000    168.025000    188.232500     154.05000\n",
       "50%      178.530000    178.870000    199.805000     164.42500\n",
       "75%      186.535000    189.112500    211.332500     172.88250\n",
       "max      216.390000    217.860000    238.700000     205.18000"
      ]
     },
     "execution_count": 14,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "lab.describe()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "2a00a2a5",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "F_onewayResult(statistic=118.70421654401437, pvalue=2.1156708949992414e-57)"
      ]
     },
     "execution_count": 15,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "import scipy.stats as stats\n",
    "stats.f_oneway(lab.iloc[:,0], lab.iloc[:,1], lab.iloc[:,2], lab.iloc[:,3])"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "5ade641f",
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "_draft": {
   "nbviewer_url": "https://gist.github.com/7a32ce3367682afd8fc97351d7672492"
  },
  "gist": {
   "data": {
    "description": "hypothesis test labtat file",
    "public": true
   },
   "id": "7a32ce3367682afd8fc97351d7672492"
  },
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.8.8"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
