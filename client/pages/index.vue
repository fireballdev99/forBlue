<template>
  <div>
    <b-container>
      <h2>แบบฟอร์มขอใช้งาน OPS</h2>
      <h3>ข้อมูลบริษัท/หน่วยงาน</h3>
      <b-form @submit="onSubmit" @reset="onReset" v-if="show">
        <b-form-group
          id="input-group-1"
          label="ชื่อบริษัท/หน่วยงาน:"
          label-for="compname"
        >
          <b-form-input
            id="compname"
            v-model="form.compname"
            type="text"
            required
          ></b-form-input>
        </b-form-group>

        <b-form-group id="name" label="ชื่อผู้ติดต่อ:" label-for="name">
          <b-form-input id="name" v-model="form.name" required></b-form-input>
        </b-form-group>

        <b-form-group
          id="taxid"
          label="เลขประจำตัวผู้เสียภาษี:"
          label-for="taxid"
        >
          <b-form-input id="taxid" v-model="form.taxid" required></b-form-input>
        </b-form-group>

        <b-form-group id="input-group-3" label="Address:" label-for="input-3">
          <b-form-textarea
            id="address"
            v-model="form.address"
          ></b-form-textarea>
        </b-form-group>

        <b-form-group id="input-group-4" v-slot="{ ariaDescribedby }">
          <b-form-checkbox-group
            v-model="form.checked"
            id="checkboxes-4"
            :aria-describedby="ariaDescribedby"
          >
            <b-form-checkbox value="me">Check me out</b-form-checkbox>
            <b-form-checkbox value="that">Check that out</b-form-checkbox>
          </b-form-checkbox-group>
        </b-form-group>

        <b-button type="submit" variant="primary">Submit</b-button>
        <b-button type="reset" variant="danger">Reset</b-button>
      </b-form>
      <b-card class="mt-3" header="Form Data Result">
        <pre class="m-0">{{ form }}</pre>
      </b-card>
    </b-container>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {
        compname: '',
        taxid: '',
        name: '',
        address: '',
      },
      show: true,
    }
  },
  methods: {
    onSubmit(event) {
      event.preventDefault()
      alert(JSON.stringify(this.form))
    },
    onReset(event) {
      event.preventDefault()
      // Reset our form values
      this.form.compname = ''
      this.form.taxid = ''
      this.form.name = ''
      this.form.address = ''

      // Trick to reset/clear native browser form validation state
      this.show = false
      this.$nextTick(() => {
        this.show = true
      })
    },
  },
}
</script>