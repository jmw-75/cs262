import React, { useState } from 'react';
import { Button, View, Text, TouchableOpacity, FlatList } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import PlayerScreen from './screens/player';
import DetailsScreen from './screens/details';
import AboutScreen from './screens/about';
import Header from './shared/header';


const Stack = createNativeStackNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator> 
        
        <Stack.Screen name="Players" component={PlayerScreen} options={({ navigation }) => ({
            headerRight: () => (
              <Header navigation={navigation}/>
            )
        })}
        />
        <Stack.Screen name="Details" component={DetailsScreen} options={({ navigation }) => ({
            headerRight: () => (
              <Header navigation={navigation}/>
            )
        })}
        />
        <Stack.Screen name="About" component={AboutScreen} />

      </Stack.Navigator>
    </NavigationContainer>
  );
}
