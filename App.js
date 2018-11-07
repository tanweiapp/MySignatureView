/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View,requireNativeComponent,Button,Alert,NativeModules} from 'react-native';
var RCTSignatureView = requireNativeComponent('MySignatureView',App);
var MySignatureViewManager = require('react-native').NativeModules.MySignatureViewManager;
type Props = {};
export default class App extends Component<Props> {
    constructor(props)
    {
        super(props);
        this.state={
            showText:' '
        }
    }
    // onClick(){
    //   alert('sssss');
    // }

    _onSaveSignatureClick(){

        MySignatureViewManager.saveSignatureImageWithresolver((error,events) => {
            if (error) {
                console.log(error);
            }else{
                console.log(events);
                this.setState({
                    showText:events
                })
                // alert(JSON.stringify(events));
            }
        });
    }

    onRemoveSignatureClick(){
        // var MySignatureViewManager = require('react-native').NativeModules.MySignatureViewManager;
        MySignatureViewManager.removeSignatureImageWithresolver((error,events) => {
            if (error){
                console.log(error);
            }else{
                console.log(events);
                this.setState({
                    showText:" "
                })
            }
        });
    }

    render() {

        return (
            <View style={styles.homeContainer}>
              <RCTSignatureView style={styles.container} {...this.props} />
              <View style={{flexDirection:'row',justifyContent:'space-between'}}>
                <Button
                    title="Save"
                    onPress={this._onSaveSignatureClick.bind(this)}
                />
                <Button
                    title="remove"
                    onPress={this.onRemoveSignatureClick.bind(this)}
                />
              </View>

              <Text>{this.state.showText}</Text>
            </View>
        );
    }
}


const styles = StyleSheet.create({
    homeContainer: {
        flex: 1,
        backgroundColor: '#F5FCFF',
    },
    container: {
        padding:30,
        borderColor:'#e7e7e7',
        marginTop:100,
        height:300,
    },
    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
    },
    instructions: {
        textAlign: 'center',
        color: '#333333',
        marginBottom: 5,
    },
});
