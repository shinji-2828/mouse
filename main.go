package main

import (
	"fmt"
	"sync"
)

var arg = []indus1Cnt{
	{indus1_cd: 1, cnt: 100},
	{indus1_cd: 2, cnt: 100},
	{indus1_cd: 3, cnt: 100},
	{indus1_cd: 4, cnt: 100},
	{indus1_cd: 5, cnt: 100},
	{indus1_cd: 6, cnt: 100},
	{indus1_cd: 7, cnt: 100},
}

type indus1Cnt struct {
	indus1_cd int
	cnt       int
}

func main() {

	res := makeIndus1Cnt(arg)
	for e := range res {
		fmt.Printf("e: %v\n", e)
	}
}

func makeIndus1Cnt(indus1Slice []indus1Cnt) chan map[int]string {

	stream := make(chan map[int]string, len(indus1Slice))
	tmp := make(map[int]string, 100)

	var wg sync.WaitGroup
	go func() {
		defer close(stream)
		for i, v := range indus1Slice {
			wg.Add(1)

			tmp[i] = fmt.Sprintf("indus1:%d", v.indus1_cd)
			fmt.Printf("ree:%s\n", tmp[i])

			wg.Done()
		}
		stream <- tmp

	}()
	wg.Wait()

	return stream

}
