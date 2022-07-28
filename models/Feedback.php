<?php

namespace app\models;

use himiklab\yii2\recaptcha\ReCaptchaValidator3;
use Yii;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "feedback".
 *
 * @property int $id
 * @property string $email
 * @property string|null $name
 * @property string $message
 * @property float|null $phone
 */
class Feedback extends ActiveRecord
{
    public $reCaptcha;
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'feedback';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['email', 'message'], 'required',
                'message'=>'Ведите значение {attribute}'],
            [['message'], 'string'],
            [['phone'], 'string'],
            ['email', 'email', 'message'=>'Неправильно указана электронная почта'],
            [['name'], 'string', 'max' => 20, 'message'=>'Превышен допустимы лимит, не более 20'],
            [['reCaptcha'], ReCaptchaValidator3::className(),
                'secret' => '6LeiaykhAAAAACuwRPv2zv5xeapTwxLrE4UrRC35', // unnecessary if reСaptcha is already configured
                'threshold' => 0.5,
                'action' => 'homepage',],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'verifyCode' => 'Подтвердите код',
            'email' => 'Электронная почта',
            'name' => 'Имя',
            'message' => 'Сообщение',
            'phone' => 'Телефон',
        ];
    }

    /* функция отправки письма на почту */
    public function contact($adminEmail)
    {
        /* Проверяем форму на валидацию */
        if ($this->validate()) {
            Yii::$app->mailer->compose()
                ->setFrom([$this->email => $this->name]) /* от кого */
                ->setTo($adminEmail) /* куда */
                ->setSubject("Форма обратной связи") /* имя отправителя */
                ->setTextBody($this->message) /* текст сообщения */
                ->send(); /* функция отправки письма */

            return true;
        }
        return false;
    }
}
