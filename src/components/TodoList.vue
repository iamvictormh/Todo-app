<template>
  <div>
    <p class="tasks">
      {{`Completed Tasks: ${completedTasks}`}}
    </p>
    <p class="tasks">
      {{`Pending Tasks: ${pendingTasks}`}}
    </p>
    <todo
      v-on:delete-todo="deleteTodo"
      v-on:complete-todo="completeTodo"
      v-for="todo in todos"
      v-bind:key="todo"
      v-bind:todo="todo"
    ></todo>
  </div>
</template>

<script type="text/javascript">
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
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#DD6B55',
        confirmButtonText: 'Yes, delete it!',
        closeOnConfirm: false
      },
      () => {
        const todoIndex = this.todos.indexOf(todo)
        this.todos.splice(todoIndex, 1)
        sweetalert('Deleted!', 'Your To-Do has been deleted.', 'success')
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
