<template>
  <div>
    <p class="tasks">
      {{`Completed Tasks: ${completedTasks}`}}
    </p>
    <p class="tasks">
      {{`Pending Tasks: ${pendingTasks}`}}
    </p>
    <Todo
      v-for="(todo,i) in todos"
      :key="i"
      :todo="todo"
      @delete-todo="deleteTodo($event)"
      @complete-todo="completeTodo($event)"
    />
  </div>
</template>

<script>
import sweetalert from 'sweetalert'
import Todo from './Todo'

export default {
  props: ['todos'],
  components: {
    Todo
  },
  computed: {
    completedTasks () {
      const completeds = this.todos.filter(todo => todo.done === true)
      return completeds.length
    },
    pendingTasks () {
      const pendings = this.todos.filter(todo => todo.done === false)
      return pendings.length
    }
  },
  methods: {
    deleteTodo (todo) {
      sweetalert({
        title: 'Are you sure?',
        text: 'This To-Do will be permanently deleted!',
        icon: 'warning',
        buttons: true,
        dangerMode: true

      }).then((willDelete) => {
        if (willDelete) {
          const todoIndex = this.todos.indexOf(todo)
          this.todos.splice(todoIndex, 1)
          sweetalert('Deleted!', 'Your To-Do has been deleted.', 'success')
        }
      })
    },
    completeTodo (todo) {
      const todoIndex = this.todos.indexOf(todo)
      this.todos[todoIndex].done = true
      sweetalert('Success!', 'To-Do completed!', 'success')
    }
  }
}
</script>

<style scoped>
p.tasks {
  text-align: center;
}
</style>
