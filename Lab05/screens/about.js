import React, { useState } from 'react';
import { Button, View, Text, TouchableOpacity, FlatList } from 'react-native';
import { globalStyles } from '../styles/global';

export default function AboutScreen({ navigation }) {
    //about information

    return (
        <Text style={ globalStyles.desc } >{"This application lists movies and movie reviews."}</Text>
        
    );
}