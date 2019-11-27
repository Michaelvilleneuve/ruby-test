[![Build Status](https://travis-ci.org/Michaelvilleneuve/ruby-test.svg?branch=master)](https://travis-ci.org/Michaelvilleneuve/ruby-test)

The game : you are a young pro cyclist, today is the world championships.

In order to win, you will have to beat your strongest opponent through a journey in the pyrenees up to the famous Col Du Tourmalet.

At the top of the tourmalet, you will face the biggest sprint of your cycling life, which essentially consists of hitting your Enter key as hard as possible !

Good luck

## Running

```bash
bundle

rake play
```

## Testing

```bash
bundle

rake test
```

## Roadmap

A list of things I would keep improving in an actual project

- Better error handling, especially on the DSL methods that can be tricky to debug
- Global functional testing
- Moving path logic to a dedicated layer
- Reduce the amount of stubs and avoid coupling between console and events context
- Better way to handle object creation in tests with a factory layer

