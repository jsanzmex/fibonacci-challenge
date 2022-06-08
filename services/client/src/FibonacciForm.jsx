import { React, Component } from 'react'
import axios from 'axios'

class FibonacciForm extends Component {
  constructor(props) {
    super(props);
    this.state = {positiveResponseReceived: false, value: '', fibonacci: ''};

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({value: event.target.value});
  }

  handleSubmit(event) {
    console.log('A value was submitted: ' + this.state.value);
    const parsed = parseInt(this.state.value, 10);
    this.setState({positiveResponseReceived: true});
    this.getFibonacci(parsed);
    event.preventDefault();
  }

  getFibonacci(position) {
    axios.get(`${import.meta.env.VITE_REACT_APP_API_SERVICE_URL}/api/fibonacci/${position}`)
    .then((res) => { this.setState({ fibonacci: res.data["value"], positiveResponseReceived: true }); })
    .catch((err) => { console.log(err); this.setState({ fibonacci: "An error ocurred!" }); });
  }

  render() {
    let result;
    if (this.state.positiveResponseReceived) {
      result = <p>Fibonacci Result: {this.state.fibonacci}</p>;
    } else {
      result = <p>Submit a number to know its position in the Fibonacci series!</p>;
    }
    return (
        <div className="App">
          <p>Calculate Fibonacci!</p>
          <form onSubmit={this.handleSubmit}>
            <input
              onKeyPress={(event) => {
                if (!/[0-9]/.test(event.key)) {
                  event.preventDefault();
                }
              }}
              type="text" value={this.state.value} onChange={this.handleChange} />
            <input type="submit" value="Calculate" />
          </form>
          {result}
        </div>
    );
  }
}

export default FibonacciForm