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
            v-model="contact.compname"
            type="text"
            required
          ></b-form-input>
        </b-form-group>

        <b-form-group
          id="taxid"
          label="เลขประจำตัวผู้เสียภาษี:"
          label-for="taxid"
        >
          <b-form-input
            id="taxid"
            v-model="contact.taxid"
            required
          ></b-form-input>
        </b-form-group>

        <b-form-group id="name" label="ชื่อผู้ติดต่อ:" label-for="name">
          <b-form-input
            id="name"
            v-model="contact.name"
            required
          ></b-form-input>
        </b-form-group>

        <b-form-group id="tel" label="เบอร์ผู้ติดต่อ:" label-for="tel">
          <b-form-input id="tel" v-model="contact.tel" required></b-form-input>
        </b-form-group>

        <b-form-group id="input-group-3" label="Address:" label-for="input-3">
          <b-form-textarea
            id="address"
            v-model="contact.address"
          ></b-form-textarea>
        </b-form-group>

        <b-button type="submit" variant="primary">Submit</b-button>
        <b-button type="reset" variant="danger">Reset</b-button>
      </b-form>
      <b-card class="mt-3" header="Form Data Result">
        <pre class="m-0">{{ contact }}</pre>
      </b-card>
    </b-container>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data() {
    return {
      contact: {
        compname: '',
        taxid: '',
        name: '',
        tel: '',
        address: '',
      },
      show: true,
    }
  },
  methods: {
    async onSubmit(event) {
      event.preventDefault()
      alert(JSON.stringify(this.contact))
      console.log(this.contact.compname)
      await axios
        .post('http://localhost:3001/creatcontact', {
          compname: this.contact.compname,
          taxid: this.contact.taxid,
          name: this.contact.name,
          tel: this.contact.tel,
          address: this.contact.address,
        })
        .then((response) => {
          console.log(response)
        })
        .catch((err) => {
          console.log(err)
        })
    },
    onReset(event) {
      event.preventDefault()
      // Reset our form values
      this.form.compname = ''
      this.form.taxid = ''
      this.form.name = ''
      this.form.tel = ''
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